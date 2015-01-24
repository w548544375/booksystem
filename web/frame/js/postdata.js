/**
 * Created by Administrator on 2015/1/4.
 */

/**
 *
 * @param detailmessage  订单的详细信息用于前台显示
 * @param totalmoney      订单的总共金额
 * @param bookdetail      要发送的数据
 * @param printmessage    要打印的数据
 */
function postData(detailmessage,totalmoney,bookdetail,printmessage)
{
    if(confirm("你的订单信息如下:\r\n"+detailmessage+"共计:"+totalmoney+".00元\r\n")) {
        //期号
        var period = $('.curentperiod', parent.document).html();
        $.ajax({
            url: '/main/saveBook',
            type: 'post',
            data: {
                "period": period,
                "bookdetail": bookdetail
            },
            success: function (data) {
                if (data == null) {
                    alert("下单失败,下单异常！");
                    $(":text").val("");
                    return;
                }
                if(data== "false"){
                    alert("下单失败，信用额度不够!");
                    $(":text").val("");
                    return;
                }

                if(data.error == "largeThanTotal"){
                    alert("下单失败，单次下单总金额超过最大值！");
                    $(":text").val("");
                    return;
                }else if(data.error == "notNumber"){
                    alert("下单失败，下单金额只能由数字构成！");
                    $(":text").val("");
                    return;
                }else if(data.error == "underMin"){
                    alert("下单失败，下单金额低于最小值！");
                    $(":text").val("");
                    return;
                }else if(data.error == "uponMax"){
                    alert("下单失败，下单金额高于最大值！");
                    $(":text").val("");
                    return;
                }


                if (confirm("下注成功，是否打印小票？")) {
                    var newWindow = window.open("打印窗口", "_blank");//打印窗口要换成页面的url
                    var mess = data.bookuser + " 订单号:#" + data.bookcode + "<br/>下单期号:" + data.bookperiod + "<br/>" + printmessage + "<br/>打印时间:" + data.booktime;
                    console.log(mess);
                    newWindow.document.write(mess);
                    newWindow.document.close();
                    newWindow.print();
                    newWindow.close();
                }
                //清空输入框
                $(":text").val("");
            },
            error: function (err) {
            }
        });
    }
}