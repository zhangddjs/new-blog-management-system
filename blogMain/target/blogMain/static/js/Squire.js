var div = document.getElementById('editor');
var editor = new Squire(div, {
    blockTag: 'p',
    blockAttributes: {'class': 'paragraph'},
    tagAttributes: {
        ul: {'class': 'UL'},
        ol: {'class': 'OL'},
        li: {'class': 'listItem'},
        a: {'target': '_blank'},
        pre: {
            style: 'border-radius:3px;border:1px solid #ccc;padding:7px 10px;background:#f6f6f6;font-family:menlo,consolas,monospace;font-size:90%;white-space:pre-wrap;word-wrap:break-word;overflow-wrap:break-word;'
        },
        code: {
            style: 'border-radius:3px;border:1px solid #ccc;padding:1px 3px;background:#f6f6f6;font-family:menlo,consolas,monospace;font-size:90%;'
        },
    }
});
Squire.prototype.makeHeader = function () {
    return this.modifyBlocks(function (frag) {
        var output = this._doc.createDocumentFragment();
        var block = frag;
        while (block = Squire.getNextBlock(block)) {
            output.appendChild(
                this.createElement('h2', [Squire.empty(block)])
            );
        }
        return output;
    });
};

document.addEventListener('click', function (e) {
    var id = e.target.id,
        value;
    if (id && editor && editor[id]) {
        if (e.target.className === 'prompt') {
            value = prompt('Value:');
        }
        editor[id](value);
    }
}, false);