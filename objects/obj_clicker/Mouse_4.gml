var num = irandom(9999999999)
var msg = msg_build_msg(MSG_8_SEG, inst_name, { "value": num})

msg_publish(msg);
