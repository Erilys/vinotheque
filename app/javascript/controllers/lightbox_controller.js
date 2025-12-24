import { Controller } from "@hotwired/stimulus";

class Lightbox {
  constructor (url, images) {
    this.element = this.buildDom(url)
    this.images = images
    this.loadImage(url)
    this.onKeyUp = this.onKeyUp.bind(this)
    document.body.appendChild(this.element)
    document.addEventListener('keyup', this.onKeyUp)
  }

  loadImage (url) {
    this.url = null
    const image = new Image();
    const container = this.element.querySelector('.lightbox__container')
    const loader = document.createElement('div')
    loader.classList.add('lightbox__loader')
    container.innerHTML= ''
    container.appendChild(loader)
    image.onload = () => {
      container.removeChild(loader)
      container.appendChild(image)
      this.url = url
    }
    image.src = url
  }

  // Accept escape key and arrows
  onKeyUp (event) {
    if (event.key === 'Escape') {
      this.close(event)
    } else if (event.key === 'ArrowLeft') {
      this.prev(event)
    } else if (event.key === 'ArrowRight') {
      this.next(event)
    }
  }

  close (event) {
    event.preventDefault()
    this.element.classList.add('fadeOut')
    window.setTimeout(() => {
      this.element.parentElement.removeChild(this.element)
    }, 500)
    document.removeEventListener('keyup', this.onKeyUp)
  }

  next (event) {
    event.preventDefault()
    let i = this.images.findIndex(image => image === this.url)
    if (i === this.images.length - 1) {
      i = -1
    }
    this.loadImage(this.images[i + 1])
  }

  prev (event) {
    event.preventDefault()
    let i = this.images.findIndex(image => image === this.url)
    if (i === 0) {
      i = this.images.length
    }
    this.loadImage(this.images[i - 1])
  }

  buildDom () {
    const dom = document.createElement('div')
    dom.classList.add('lightbox')
    dom.innerHTML = `<button class="lightbox__close"></button>
    <button class="lightbox__next"></button>
    <button class="lightbox__prev"></button>
    <div class="lightbox__container"></div>`
    dom.querySelector('.lightbox__close').addEventListener('click',
      this.close.bind(this))
    dom.querySelector('.lightbox__next').addEventListener('click',
      this.next.bind(this))
    dom.querySelector('.lightbox__prev').addEventListener('click',
      this.prev.bind(this))
    return dom
  }
}

// Connects to data-controller="lightbox"
export default class extends Controller {
  static targets = ['img']

  open(event) {
    new Lightbox(event.currentTarget.dataset.fullSrc, this.allImgSrc)
  }

  get allImgSrc() {
    return this.imgTargets.map((imgTarget) => {
      return imgTarget.dataset.fullSrc
    })
  }
}
