import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ 'template', 'commonLabels' ]

  static values = {
    originIndex: Number,
    indexName: String
  }

  connect(){
    super.connect()
    this.templateTarget.closest('form').addEventListener('submit', this.removeTemplate.bind(this))
    this.runningIndex = this.originIndexValue
    this.numberOfNestedForms = this.originIndexValue
  }

  addItem(e){
    e.preventDefault()

    const new_item = this.templateTarget.cloneNode(true)
    new_item.removeAttribute('data-nested-form-target')
    new_item.setAttribute('data-nested-form-item', '')
    new_item.classList.remove('hidden')
    const template_index = new RegExp(this.indexNameValue,'g')
    new_item.innerHTML = new_item.innerHTML.replace(template_index, this.runningIndex)
    this.templateTarget.insertAdjacentElement('beforebegin', new_item)

    this.runningIndex += 1
    this.numberOfNestedForms += 1

    this.handleLabelDisplay()
  }

  removeTemplate(){
    this.templateTarget.remove()
  }

  removeItem(e){
    e.preventDefault()
    this.numberOfNestedForms -= 1
    this.handleLabelDisplay()
    e.currentTarget.closest('[data-nested-form-item]').remove()
  }

  handleLabelDisplay(){
    if (!this.hasCommonLabelsTarget) {
      return
    } else if (this.numberOfNestedForms > 0) {
      this.commonLabelsTarget.classList.remove('hidden')
    } else {
      this.commonLabelsTarget.classList.add('hidden')
    }
  }
}
