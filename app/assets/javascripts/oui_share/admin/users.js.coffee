$ ->
  $('#users-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#users-table').data('source')
    pagingType: 'full_numbers'
    iDisplayLength: 25
    columnDefs: [{ orderable: false, targets: 4 }]
    # optional, if you want full pagination controls.
    # Check dataTables documentation to learn more about
    # available options.
