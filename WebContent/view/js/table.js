/**
 * Created by tonie on 2/28/14.
 */

window.XTableRosters = {

};

window.XHandlers = {

    "INPUT" : function(node, if_except_fn)  {

        if ( if_except_fn && if_except_fn( node ) ) { return; }

        var value = node.value;
        var parentNode = node.parentNode;
        parentNode.innerHTML = '';

        var div = document.createElement('div');
        div.innerHTML = value;
        parentNode.appendChild(div);
    },

    'TEXTAREA' : function(node) {
        var value = node.innerHTML;
        var parentNode = node.parentNode;
        parentNode.innerHTML = '';

        var div = this.new_div();
        div.innerHTML = value;
        parentNode.appendChild(div);
    }
};

window.ReverseXHandler = {
    "DIV" : function(node, if_except_fn)  {
        if ( if_except_fn && if_except_fn( node ) ) { return; }

        var value = node.innerHTML;
        var parentNode = node.parentNode;
        parentNode.innerHTML = '';

        var input = document.createElement('input');
        input.style.width = "80px";
        input.value = value;
        parentNode.appendChild(input);
    }
};



/*
==========================================================================
 */

window.XUtil = {
    new_ : function(tag_name) {
        var new_node = document.createElement( tag_name );
        if ( !new_node ) { return null; }
        new_node.set = function(attr_k_v) {
            var key;
            for( key in attr_k_v ) {
                var val = attr_k_v[key];
                this.setAttribute(key, val);
            }
        };
        return new_node;
    },

    delete_table : function(root ,tid) {
    	var table = root.getElementById(tid);
    	root.body.removeChild(table);
        delete window.XTableRosters[tid];
    }
	
};


window.XTable = function(table_info) {

    var table_obj = this;
    var table_util = window.XUtil;
    this.caption = table_info['caption'];
    this.fields  = table_info['fields']? table_info['fields'] : [];
    this.rows = [];
    this.foot = table_info['foot'];

    // init operation for actual elements.
    this.table_element = table_util.new_('table');

    this.table_element.set({id:table_info['id']});
    window.XTableRosters[table_info['id']] = this;

    this.field_elements = [];
    this.caption_element = this.caption? function(){
        var node = table_util.new_('caption');
        node.innerHTML = table_obj.caption;
        table_obj.table_element.appendChild(node);
        return node;
    }() : null;
    this.thead_element   = function() {
        var head = table_util.new_('thead');
        var row  = table_util.new_('tr');

        table_obj.fields.forEach(function(field_name) {
            var cell = table_util.new_('th');
            cell.innerHTML = field_name;
            table_obj.field_elements.push(cell);
            row.appendChild(cell);
        });

        head.appendChild(row);
        table_obj.table_element.appendChild(head);

        return head;
    }();
    this.tfoot_element = this.foot? function() {
        var foot = table_util.new_('tfoot');
        var row  = table_util.new_('tr');

        table_obj.foot.forEach(function(content){
            var cell = table_util.new_('td');
            cell.innerHTML = content;
            row.appendChild(cell);
        });

        foot.appendChild(row);
        table_obj.table_element.appendChild(foot);

        return foot;

    }() : undefined;
    this.tbody_element   = table_util.new_('tbody');
    this.table_element.appendChild(this.tbody_element);
    this.row_elements = [];
};

window.XTable.prototype = {
    table_util : window.XUtil,

    new_record : function(msg, style) {
        var that = this;
        var record = this.table_util.new_('tr');
        record.set(style);

        this.fields.forEach(function(field_name){
            var cell = that.table_util.new_('td');
            cell.innerHTML = msg[field_name];
            record.appendChild(cell);
        });

        return record;
    },

    insert_record : function(before, record) {

        var msg = {};
        var count = 0;
        var that = this;
        this.fields.forEach(function(field_name){
            msg[field_name] = record.cells[count].innerHTML;
            count ++;
        });

        this.rows.push(msg);
        this.row_elements.push(record);
        this.tbody_element.insertBefore(record, before);
    },

    insert_latest : function(record) {
        this.insert_record( 0, record);
    },

    record_count : function() {
        return this.rows.length;
    },

    get_record_at : function(index) {
        return this.row_elements[index];
    },

    first_record : function() {
        return this.get_record_at(0);
    },

    last_record  : function() {
        return this.get_record_at(this.record_count()-1);
    },

    delete_row_at : function(index) {
    	
        this.table_element.deleteRow(index+1);
        delete this.rows[index];
        delete this.row_elements[index];
    },


    selected_index : function(handler) {
        var count = 0;
        this.table_element.rows.forEach(function(row) {
            row.onclick = function() {
                handler(count, row);
            };
            count ++ ;
        });
    },


    selected_row : function(handler) { // index, obj as arguments
        return this.row_elements[this.selected_index(handler)];

    },

    update_row_at : function(index, new_msg) {
        this.rows[index] = new_msg;
        var that = this;
        var old_node = this.row_elements[index];
        var record = this.table_util.new_('tr');
        this.fields.forEach(function(filed_name){
            var cell = that.table_util.new_('td');
            cell.innerHTML = new_msg[filed_name];
            record.appendChild(cell);
        });
        this.row_elements[index] = record;
        this.tbody_element.insertBefore(record, old_node);
        this.tbody_element.removeChild(old_node);
    },

    foreach_row : function(handler) { // row
        this.row_elements.forEach(handler);
    },

    foreach_cell_at_row : function(index, handler) {

        var cells = this.row_elements[index].cells;
        for(var i = 0; i < cells.length; ++i) {
            handler(cells[i]);
        }

    },

    foreach_body_cell : function(handler) {

        for( var index in this.row_elements ) {
            this.foreach_cell_at_row(index, handler);
        }

    }


};

