/**
 * Created by Administrator on 2015/1/11.
 */

function pageShow(pagediv,totalpage,pagefunc,page,pagesize){
    var text="";
    if(!(page > 1))
        text += "<li class=\"disabled\"><a href=\"#\">&laquo;</a></li>";
    else
        text += "<li><a onclick=\""+pagefunc+"("+(page-1)+","+pagesize+");"+"\">&laquo;</a></li>";

    for(var i=page;i<=totalpage;i++){
        text += "<li><a onclick=\""+pagefunc+"("+(page-1+i)+","+pagesize+");"+"\">"+i+"</a></li>";
        }

      if(page < totalpage)
       text += " <li><a onclick=\""+pagefunc+"("+(page+1)+","+pagesize+");"+"\">&raquo;</a></li>";
      else
        text+=  "<li class=\"disabled\"><a href=\"#\">&raquo;</a></li>";
   // <li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>

     $("."+pagediv).html(text);
}