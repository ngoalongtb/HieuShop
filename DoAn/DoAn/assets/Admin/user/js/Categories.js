var categories = {
    init: function () {
        categories.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active-status').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Categories/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    console.log(response);
                    if (response.status == true) {
                        btn.text('Kích hoạt');
                    }
                    else if(response.status == false)
                    {
                        btn.text('Khoá');
                    }
                }
            });
        });
    }
}
categories.init();