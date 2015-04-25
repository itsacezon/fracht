$(document).ready(function() {
  $('#shipment-status').selectize({
    create: false,
    readOnly: true,
  });

  $('#vehicle-type').selectize({
    create: false,
    readOnly: true,
  });

  $('[data-remodal-target="shipment-modal"]').click(function(e) {
    e.preventDefault();
    var shipmentModal = $.remodal.lookup[$('[data-remodal-id="shipment-modal"]').data('remodal')];
  });


});
