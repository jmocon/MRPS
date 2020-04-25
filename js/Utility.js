class Utility {
    constructor() { }

    SendData(data) {
        var a = $.ajax({
            type: "POST",
            //url: "http://192.168.1.2/MRPS/ajax/" + data.url,
            //url: "http://www.freelance.com/MRPS/ajax/" + data.url,
            url: "http://localhost/ajax/" + data.url,
            data: JSON.stringify(data.param),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            processdata: true
        });

        return a;
    }

    AlertBox(data) {
        var obj = {
            type: (data) ? data.type : "info",
            title: (data) ? data.title : "",
            message: (data) ? data.message : "",
            helper: (data) ? data.helper : ""
        };

        var output = `
        <div class="alert alert-`+ obj.type + `" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        `;
        if (obj.title) {
            output += `<h4 class="alert-heading">` + obj.title + `</h4>`;
        }
        if (obj.message) {
            output += obj.message;
        }
        if (obj.helper) {
            output += `<hr /><p class="mb-0">` + obj.helper + `</p>`;
        }
        output += `</div>`;

        return output;
    }

    AlertServerFailed() {
        var alert = {
            type: "danger",
            title: "Failed to connect to Server",
            message: "Please restart the application"
        }
        return this.AlertBox(alert);
    }

    Loading(element) {
        $(element).html(`
      <div class="row">
        <div class="col-12 text-center p-2">
          <div class="loader vertical-align-middle loader-circle"></div>
        </div>
      </div>

      `);
    }
}
