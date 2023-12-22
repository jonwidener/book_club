import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="drawer"
export default class extends Controller {
  connect() {}

  openNav() {
    //opens side navbar by 70 percent
    document.getElementById('mySidenav').classList.add('min-w-fit');

    //opens overlay display
    document.getElementById('backdrop').style.display = 'block';
  }

  closeNav() {
    //closes side navbar totally
    document.getElementById('mySidenav').classList.remove('min-w-fit');

    //removes overlay display
    document.getElementById('backdrop').style.display = 'none';
  }
}
