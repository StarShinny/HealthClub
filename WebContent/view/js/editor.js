window.defl_str = '';

function obj(o){
	return document.getElementById(o);
}

function init_editor(args){
	var editor = obj(args['editor']);
    window.defl_str = args['defl_val'];
	editor.innerHTML = defl_str;
	
	editor.onblur = function(){
		if(editor.innerHTML == ''){
			editor.innerHTML = defl_str;
			//obj('editor_bar').style.display = 'none';
		}
	};
	editor.onfocus = function(){
		if(editor.innerHTML == defl_str){
			editor.innerHTML = '';
			obj(args['btn_bar']).style.display = 'inline';
		}
	};

	init_editor_action(args);
    init_upload(args);
}

function init_editor_action(args){
	ins_pic = obj(args['pic_btn']);
	post_ans = obj(args['pst_btn']);

	ins_pic.onclick = function(){
		obj(args['upload_btn']).click();
	};

	ins_pic.onblur = function(){
		obj(args['upload_btn']).style.display='none';
	};



	post_ans.onclick = function(){
		var content = obj(args['editor']).innerHTML;
		var is_valid = true;
		if(content == defl_str || content.length == 0){
			is_valid = false;
		}else{
			console.log("send:　" + content.toString());
			//judge...
			obj(args['editor']).innerHTML = defl_str;
		}		
		
		if(is_valid){
			trigger_('发布成功!');	
		}else{
			trigger_('发布失败，请检查网络!');
		}		  
	};
}

function trigger_(msg){
	
	if(obj('myModelLabel')){
		console.log('exists');
		obj('myModelLabel').innerHTML = msg;		
	}else{		
		var modal = '<div id="modal-container-912346" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">' +
						'<div class="modal-header">' +						
							'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>' +					
						'</div>' +
						'<div class="modal-body">' +
							'<h4 id="myModalLabel">' +
								msg + 
							'</h4>' +
						'</div>' +
					'</div>';
		obj('btns').innerHTML = modal;
	}		
}

function init_upload(args){
    $(function () {
        $('#'+args['upload_btn']).fileupload({
            dataType: 'json',

            progressall: function (e, data) {

            },

            done: function (e, data) {
                $.each(data.result.files, function (index, file) {
                    $('<p/>').text(data.result).appendTo(document.body);
                    var editor = document.getElementById(args['editor']);
                    img = "<img style='height: 200px;' src='server/php/files/" + file.name + "' alt='Picture Not Found.' />";
                    if(editor.innerHTML!= args['defl_val']){
                        editor.innerHTML = editor.innerHTML + "<p></p>" + img;
                    }else{
                        editor.innerHTML = img;
                    }
                });
            }

        });
    });
}

//modified!
function modify_attr(k, list){
    obj(list[k] + 'li').className = '';
    obj(list[k] + 'div').style.display = 'none';
}

//modified!
function define_on_click(id, list){
    obj(id).onclick = function(){
        console.log('click on ' + id.toString());
        obj(id + 'li').className = 'active';
        obj(id + 'div').style.display = 'inline';

        for(k in list){
            if(list[k] != id){
                modify_attr(k, list);
            }
        }
    };
}

//modified!
function init_switch_tab(reg_list){
    var list = reg_list;
    for(key in list){
        define_on_click(list[key], list);
    }
}



