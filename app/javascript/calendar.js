function pullDown(){
  const pullDownButton = document.getElementById("calendar-button")
  const pullDownParents = document.getElementById("pull-down")

  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:blue;")
  })
  pullDownButton.addEventListener('mouseout', function(){
    pullDownButton.removeAttribute("style", "background-color:blue;")
  })
  pullDownButton.addEventListener('click', function(e){
    if (pullDownParents.getAttribute("style") == "display:block;"){
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
      pullDownParents.style.left = e.pageX+"px"
      pullDownParents.style.top = e.pageY+"px"
    }
  })
}

window.addEventListener('load', pullDown)