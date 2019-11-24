addEventListener("direct-upload:initialize", event => {
    const { target, detail } = event
    const { id, file } = detail
    target.insertAdjacentHTML("beforebegin", `
      <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
        <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
        <span class="direct-upload__filename">${file.name}</span>
      </div>
    `)
})

addEventListener("direct-upload:start", e => {
    const { id } = e.detail
    const id_string = `direct-upload-${id}`
    document.getElementById(id_string).classList.remove("direct-upload--pending")
})

addEventListener("direct-upload:progress", event => {
    const { id, progress } = event.detail
    const progressElement = document.getElementById(`direct-upload-progress-${id}`)
    progressElement.style.width = `${progress}%`
})

addEventListener("direct-upload:error", event => {
    event.preventDefault()
    const { id, error } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.add("direct-upload--error")
    element.setAttribute("title", error)
})

addEventListener("direct-upload:end", event => {
    let { id } = event.detail
    let element = document.getElementById(`direct-upload-${id}`)
    element.classList.add("direct-upload--complete")
})