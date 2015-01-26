$('.station').each(function(i) {
        var classes = this.className.split(/\s+/);
        for (var i=0,len=classes.length; i<len; i++){
            if ($('li').hasClass(classes[i])){
                $(this).addClass('highlighted');
            }
        }
    });

