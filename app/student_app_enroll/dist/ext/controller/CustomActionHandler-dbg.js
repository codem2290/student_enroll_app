sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        activateCourseStatus: function (oContext, aSelectedContexts) {
            let sActionName = "activateCourse";
            let oParameters = {
                model: this.getModel(),
                parameterValues: [{
                    name: "courseID",
                    value: oContext.getObject().ID
                }],
                skipParameterDialog: true
            };
            this.editFlow.invokeAction(sActionName, oParameters).then(function (oresponse) {
                this._controller.getExtensionAPI().refresh();
            }.bind(this)).catch(function (error) {
                console.error(error)
            });
        }
    };
});
