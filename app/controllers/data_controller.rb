# frozen_string_literal: true

require 'csv'

# Controls import/export of data
class DataController < ApplicationController
  attr_reader :header, :table

  def index; end

  def import
    CSV.parse(lines).each do |row|
      import_row(row)
    end
  end

  def import_row(row)
    if row.empty?
      need_header
    elsif table_name_row?(row)
      @table = Object.const_get(row[0])
    elsif need_header?
      @header = row.map(&:to_sym)
      got_header
    else
      table_create(header, row)
    end
  end

  def table_name_row?(row)
    row.length == 1 && need_header?
  end

  def got_header
    @need_header = false
  end

  def need_header
    @need_header = true
  end

  def need_header?
    @need_header.nil? || @need_header
  end

  def lines
    params[:data].read
  end

  def table_create(header, row)
    object = {}
    header.each_with_index do |value, index|
      object[value] = row[index].gsub('\\n', "\n")
    end
    table.create! object
  end

  def export
    @csv_string = "#{csv_table(Book.all)}#{csv_table(Chapter.all)}#{csv_table(Comment.all)}"

    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = 'attachment; filename=book_club_data.csv'
      end
    end
  end

  def csv_table(table)
    return '' unless table.size.positive?

    csv_string = "\"#{table.first.class}\"\n"
    csv_string += "\"#{table.first.attributes.keys.join('","')}\"\n"
    table.each do |row|
      csv_string += csv_row(row)
    end

    csv_string += "\n"
  end

  def csv_row(row)
    escaped_quotes = row.attributes.values.map { |el| el.to_s.gsub('"', '""') }
    escaped_new_lines = escaped_quotes.map { |el| el.to_s.gsub("\n", '\\n') }
    quoted_cells = escaped_new_lines.map { |el| "\"#{el}\"" }
    stringified = quoted_cells.join(',')
    "#{stringified}\n"
  end
end
