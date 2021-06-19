//function pullDown(){
//  let table = document.getElementById("calendar-button")
//  let pullDownParents = document.getElementById("pull-down")
//  let cells = table.querySelectorAll('td')

//  cells.forEach(function (cell){
//    cell.addEventListener('click', function(e){
//      if (pullDownParents.getAttribute("type") == "test"){
//        pullDownParents.removeAttribute("style", "display:block;")
//       pullDownParents.removeAttribute("type", "test")
//      } else {
//        pullDownParents.setAttribute("style", "display:block;")
//        pullDownParents.style.left = e.pageX+"px"
//        pullDownParents.style.top = e.pageY+"px"
//        pullDownParents.setAttribute("type", "test")
//        console.log(cell.innerHTML)
//      }
//    })
//  })
//}

//window.addEventListener('load', pullDown)