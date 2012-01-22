*{
 *  insert a script tag in the template.
 *  by convention, referred script must be put under /public/javascripts
 *    src     (required)   : script filename, without the leading path "/public/javascripts"
 *    id      (opt.)       : sets script id attribute
 *    charset (opt.)       : sets source encoding - defaults to current response encoding
 *
 *    #{script id:'datepicker' , src:'ui/ui.datepicker.js', charset:'${_response_encoding}' /}
}*
%{
    (_arg ) && (_src = _arg);

    if (!_src) {
        throw new play.template2.exceptions.GTTemplateRuntimeException("src attribute cannot be empty for script tag");
    }
    _src = "/assets/javascripts/" + _src
    try {
        _abs = controllers.routes.Assets.at(\"/public/javascripts/" + _src + "\").url();
    } catch (Exception ex) {
        throw new play.template2.exceptions.GTTemplateRuntimeException("File not found: " + _src);
    }
}%
<script type="text/javascript" language="javascript"#{if _id} id="${_id}"#{/if}#{if _charset} charset="${_charset}"#{/if}  src="${_abs}"></script>