/**
 * Created by tonie on 2/23/14.
 */

var Util = window.util = {
    display_struct : function() {
        console.log(this);
    }
};

window.util.emp_fn = function(){};

window.util.form = {
    forms : {},
    create_new : function(form_name, form_info) {

        var arg_list = form_info;
        var action = arg_list['action']? arg_list['action'] : '';
        var method = arg_list['method']? arg_list['method'] : 'GET';
        var _class = arg_list['_class']? arg_list['_class'] : '';
        var id = arg_list['id']? arg_list['id'] : undefined;
        var submit_btn_id = arg_list['submit_btn']? arg_list['submit_btn'] : undefined;
        var submit_onclick = arg_list['submit_onclick']? arg_list['submit_onclick'] : function() { return true };

        var new_form = document.createElement('form');
        new_form.setAttribute('action', action);
        new_form.setAttribute('method', method);
        new_form.setAttribute('_class', _class);
        if( id ) { new_form.setAttribute('id', id); }

        var submit_btn = document.createElement('button');
        submit_btn.innerHTML = form_info['submit_btn_name'] ? form_info['submit_btn_name'] : 'Submit';
        submit_btn.type = 'submit';
        submit_btn.onclick = submit_onclick;
        if(submit_btn_id) { submit_btn.id = submit_btn_id; }

        new_form.appendChild(submit_btn);
        this.forms[form_name] = new_form;

        var new_element = this.create_new_element;

        new_form.add_field = function(field_info) {
            var field = new_element(field_info);
            var last_child = this.lastElementChild;
            this.insertBefore(field, last_child);
        };

        return new_form;
    },

    create_new_element : function(element_info) {
        var tag_name = element_info['tag'];
        var new_element = document.createElement(tag_name);

        for(var key in element_info) {

            if(key == 'tag') { continue; }

            var value = element_info[key];
            new_element.setAttribute(key, value);
        }
        return new_element;
    },



    remove_form : function(form_name) {
        if( form_name in this.forms ) {
            delete this.forms[form_name];
            return true;
        } else {
            return false;
        }
    }



};

window.util.table = {

    tables : {},
    types  : {
        header : {
            block: 'thead',
            unit : 'th'
        },
        body   : {
            block: 'tbody',
            unit : 'td'
        },
        footer : {
            block: 'tfooter',
            unit : 'td'
        },
        row    : 'tr',
        cell   : 'td'
    },
    new_one : function(table_id, table_info) {
        var new_table = document.createElement('table');
        new_table.id = table_id;
        this.tables[table_id] = new_table;

        // init table element
        var id = table_info['id']? table_info['id'] : undefined;
        var _class = table_info['class']? table_info['class'] : undefined;
        if( _class ) { new_table.setAttribute('class', _class); }
        if( id ) { new_table.setAttribute('id'); }

        // init t-header
        if( table_info['header'] ) { new_table.appendChild( this.init_table_( 'header', table_info['header'] ) ); }
        // init t-body
        new_table.appendChild( this.init_table_( 'body', [] ) );
        // init t-footer
        if( table_info['footer'] ) { new_table.appendChild( this.init_table_( 'footer', table_info['footer'] ) ); }

        new_table.add = function(new_record) {
            this.tBodies[0].appendChild(new_record);
        };
        new_table.remove = function(row_id) {
            var child_count = this.tBodies[0].children.length;
            if ( row_id >= child_count ) { return false; }
            this.deleteRow(row_id);
        };

        return new_table;
    },
    remove : function(table_id) {
    	document.body.removeChild(document.getElementById(table_id));
        delete this.tables[table_id];
        
    },
    create_new_ : function(type_name, sub_name) {
        var new_node = document.createElement(sub_name ? this.types[type_name][sub_name] : this.types[type_name]);
        new_node.set = function(attr_k_v) {
            var key;
            for( key in attr_k_v ) {
                var val = attr_k_v[key];
                this.setAttribute(key, val);
            }
        };
        return new_node;
    },
    init_table_ : function(_type, value_list) {
        var part = this.create_new_(_type, 'block');
        if( value_list.length > 0 ) {
            var new_row = this.create_new_('row');
            var index;
            for( index in value_list ) {
                var unit = this.create_new_(_type, 'unit');
                unit.innerHTML = value_list[index];
                new_row.appendChild(unit);
            }
            part.appendChild(new_row);
        }
        return part;
    },
    new_record : function(fields) {
        var new_row = this.create_new_('row');
        var index;
        for( index in fields ) {
            var field = this.create_new_('cell');
            field.innerHTML = fields[index];
            new_row.appendChild(field);
        }
        return new_row;
    }
};

window.util.id_dict = {

    id_dict : {},
    init    : function() {
        var allNodes = document.all;
        var node;
        for(node in allNodes) {
            if(allNodes[node].hasOwnProperty('id')) {
                this.id_dict[allNodes[node].id] = node;
            }
        }
    },
    reg_new_node : function(id, obj) {
        if(this.id_dict.hasOwnProperty(id)) {
            return false;
        } else {
            id_dict[id] = obj;
            return true;
        }
    },
    rm_reg_node : function(id) {
        if(this.id_dict.hasOwnProperty(id)) {
            delete this.id_dict[id];
            return true;
        } else {
            return false;
        }
    },
    get_dict : function() {
        //search for all id in current page and store them
        var dictionary_cache = this.id_dict;
        var origin = this;
        return {
            cache : dictionary_cache,
            find : function(id) {
                if(this.contains(id)) {
                    return this.cache[id];
                } else {
                    return false;
                }
            },
            contains : function(id) {
                return this.cache.hasOwnProperty(id);
            },
            gen_sym : function() {
                //generate symbol
                var sym;
                do{
                    var rand = Math.round(Math.random()*10000+1);
                    sym = "id_" + rand;
                }while(this.contains(sym));

                return sym;
            }
        };
    }
};

window.util.js_for_html = {
    files_onload : {},
    defaults : {
        Boostrap_js : "js/bootstrap.min.js",
        Boostrap_css: "css/bootstrap.min.css",
        jQuery   : "http://code.jquery.com/jquery.js"
    },
    init_load_file : function( urls ) {
        if ( urls['default'] ) {
            var dindex;
            for ( dindex in urls['default'] ) {
                var key = urls['default'][dindex];
                var durl = this.defaults[key].url;
                var fn   = this.defaults[key].onload;
                if( durl ) {
                    var dsrc = this.new_resource(durl);
                    dsrc.onload = fn? fn : window.util.emp_fn;
                    document.body.appendChild(dsrc);
                    this.files_onload[key] = durl;
                }
            }
        } else {
            for ( var index in urls ) {
                var url = urls[index].url;
                var fn  = urls[index].onload;
                if( url ) {
                    var src = this.new_resource(url);
                    src.onload = fn? fn : window.util.emp_fn;
                    document.body.appendChild(src);
                    this.files_onload[index] = url;
                }
            }
        }
    },
    new_resource : function(url) {
        var js_rsc = document.createElement('script');
        js_rsc.type = 'text/javascript';
        js_rsc.src = url;
        return js_rsc;
    },
    load : function(src_name, src_url) {
        if( this.exist(src_url) ) { return false; }
        this.files_onload[src_name] = src_url;
        var src = this.new_resource(src_url);
        document.body.appendChild(src);
        return true;
    },
    exist : function(url) {
        var files = this.files_onload;
        for ( var k in files) {
            var cur_url = files[k];
            if( cur_url == url ) {
                return true;
            }
        }
        return false;
    }

};

window.handlers = {
	    "INPUT" : function(node)  {
	    	
	    	if ( node.type == 'button' ) {
	    		return;
	    	}
	    	
	        var value = node.value;
	        var parentNode = node.parentNode;
	        parentNode.innerHTML = '';

	        var div = window.tableUtil.new_div();
	        div.innerHTML = value;
	        div.setAttribute('style','width:100px');
	        parentNode.appendChild(div);
	    },

	    'TEXTAREA' : function(node) {
	        var value = node.innerHTML;
	        var parentNode = node.parentNode;
	        parentNode.innerHTML = '';

	        var div = window.tableUtil.new_div();
	        div.innerHTML = value;
	        parentNode.appendChild(div);
	    },
	    
	    "" : function(node) {
	    	
	    }
	    
	};

window.tableUtil ={
	    forEachChild : function(handler) {
	    	
	        var childNodes = this.children;
	        for ( var i in childNodes ) {
	        	
	            var child = childNodes[i];
	            
	            if ( (typeof child) != 'object' ) {
	            	continue;
	            }
	            
	            handler(child);
	            child.forEachChild = this.forEachChild;
	            child.forEachChild(handler);
	        }
	    },

	    decorate : function ( table ) {
	        table.forEachChild = this.forEachChild;
	        return table;
	    },

	    subsitute_content : function(node) {
	        if ( !node ) { return false;}
	        
	        var tagName = node.tagName;
	        
	        if ( window.handlers[tagName] ) {
	            window.handlers[tagName](node);
	        } else {
	        	return false;
	        }
	        return true;
	    },

	    new_div : function() {
	        return document.createElement('div');
	    }
	};




