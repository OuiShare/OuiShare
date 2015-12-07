# $(document).ready(function() {
#    $(function() {
#      return $('#table_id').dataTable({
#        processing: true,
#        serverSide: true,
#        ajax: 'ajax_url',
#        columns: [
#          {data: '0' },
#          {data: '1' },
#          {data: '2' }
#        ]
#      });
#    });
#  });

$ ->
  $('#users-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#users-table').data('source')
    pagingType: 'full_numbers'
    # optional, if you want full pagination controls.
    # Check dataTables documentation to learn more about
    # available options.
