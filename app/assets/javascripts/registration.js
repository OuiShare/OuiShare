$(document).ready(function(){
  // $('#user_language_id').append(newOption);
  // $('#user_language_id').val(newOption);
	$("#new_user").validate({
    rules: {
     'user[birthday(1i)]': {
      required: true
     },
     'user[birthday(2i)]': {
      required: true
     },
     'user[birthday(3i)]': {
      required: true
     },
     'user[language_id]': {
      required: true
     },
     'user[user_source_id]': {
      required: true
     },
     'user[country]': {
      required: true
     },
     'user[gender]': {
      required: true
     },
     'user[occupation_id]': {
      required: true
     }

    },
    messages: {
     'user[birthday(1i)]': {
      required: "Please select a year",
     },
     'user[birthday(2i)]': {
      required: "Please select a month"
     },
     'user[birthday(3i)]': {
      required: "Please select a day"
     },
     'user[language_id]': {
      required: "Please select a language",
     },
     'user[user_source_id]': {
      required: "Please select an option from the list, if none are appropriate please select 'Other'"
    },
     'user[country]': {
      required: "Please select a country"
     },
     'user[gender]': {
      required: "Please select an option"
     },
     'user[occupation_id]': {
      required: "Please select an occupation"
     }
  }
});
});