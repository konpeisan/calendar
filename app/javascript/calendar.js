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
    if (pullDownParents.getAttribute("type") == "test"){
      console.log("click")
      pullDownParents.removeAttribute("style", "display:block;")
      pullDownParents.removeAttribute("type", "test")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
      pullDownParents.style.left = e.pageX+"px"
      pullDownParents.style.top = e.pageY+"px"
      pullDownParents.setAttribute("type", "test")
    }
  })
}

window.addEventListener('load', pullDown)