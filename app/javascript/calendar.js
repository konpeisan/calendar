function pullDown(){
  const table = document.getElementById("calendar-button")
  const pullDownParents = document.getElementById("pull-down")
  const Td = table.getElementsByTagName('td')

  for(var i=0; i<Td.length; i++){
    Td[i].onclick= function(e){
      if (pullDownParents.getAttribute("type") == "test"){
        pullDownParents.removeAttribute("style", "display:block;")
        pullDownParents.removeAttribute("type", "test")
      } else {
        pullDownParents.setAttribute("style", "display:block;")
        pullDownParents.style.left = e.pageX+"px"
        pullDownParents.style.top = e.pageY+"px"
        pullDownParents.setAttribute("type", "test")
      }
    }
  }
}

window.addEventListener('load', pullDown)