import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ 'form' ]

  // static values = {
  //   originIndex: Number,
  //   indexName: String
  // }

  connect(){

  }

  submitForm(){
    this.formTarget.submit()
  }
}
