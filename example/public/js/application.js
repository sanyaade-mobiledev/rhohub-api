// env functions

function setUrl(){
	var url = $('#url').val();
	start_request("url-submit", "url-status");
	$.ajax({
	  type: 'POST',
	  url: '/set_url',
	  data: {id : url},
	  dataType: 'json',
	  success: function(resp){
		success_request("url-submit", "url-status");
	  },
	  error: function(resp){
		error_request("url-submit", "url-status");
	  }
	});
}

function setToken(){
	var token = $('#token').val();
	start_request("token-submit", "token-status");
	$.ajax({
	  type: 'POST',
	  url: '/set_token',
	  data: {id : token},
	  dataType: 'json',
	  success: function(resp){
		// show success label
		success_request("token-submit", "token-status");
	  },
	  error: function(resp){
		error_request("token-submit", "token-status");
	  }
	});
}

// app functions ----------------------------------

function createApp(){
	var name = $('#app-name').val();
	start_request("create-app-submit", "create-app-status");
	$.ajax({
		  type: 'POST',
		  url: '/create_app',
		  data: {id : name},
		  dataType: 'json',
		  success: function(response){
			success_request("create-app-submit", "create-app-status");
			$('#app-create-result').text("Response=> " + response.resp);
		  },
		  error: function(resp){
			error_request("create-app-submit", "create-app-status");
			r = JSON.parse(resp.responseText);
			$('#app-create-result').text("Response=> " + r.text);
		  }
		});
}

function deleteApp(){
	var id = $('#app-id').val();
	start_request("delete-app-submit", "delete-app-status");
	$.ajax({
		  type: 'DELETE',
		  url: '/delete_app',
		  data: {id : id},
		  dataType: 'json',
		  success: function(response){
			success_request("delete-app-submit", "delete-app-status");
			$('#app-delete-result').text("Response=> " + response.resp);
		  },
		  error: function(resp){
			error_request("delete-app-submit", "delete-app-status");
			r = JSON.parse(resp.responseText);
			$('#app-delete-result').text("Response=> " + r.text);
		  }
		});
}


function showApp(){
	var name = $('#show-app-name').val();
	start_request("show-app-submit", "show-app-status");
	$.ajax({
		  type: 'GET',
		  url: '/show_app',
		  data: {id : name},
		  dataType: 'json',
		  success: function(response){
			success_request("show-app-submit", "show-app-status");
			$('#app-show-result').text("Response=> " + response.resp);
		  },
		  error: function(resp){
			error_request("show-app-submit", "show-app-status");
			r = JSON.parse(resp.responseText);
			$('#app-show-result').text("Response=> " + r.text);
		  }
		});
}

function listApp(){
	start_request("list-app-submit", "list-app-status");
	$.ajax({
		  type: 'GET',
		  url: '/list_app',
		  dataType: 'json',
		  success: function(response){
			success_request("list-app-submit", "list-app-status");
			$('#app-list-result').text("Response=> " + response.resp);
		  },
		  error: function(resp){
			error_request("list-app-submit", "list-app-status");
			r = JSON.parse(resp.responseText);
			$('#app-list-result').text("Response=> " + r.text);
		  }
		});
}
// build functions ----------------------------------



function createbuild(){
	var id = $('#create-app-id').val();
	var targetDevice = $('#target-device').val();
	var versionTag = $('#version-tag').val();
	var rhodesVersion = $("#rhodes-version").val();
	
	start_request("create-build-submit", "create-build-status");
	$.ajax({
		  type: 'POST',
		  url: '/create_build',
		  data: {id : id, targetDevice: targetDevice, versionTag : versionTag, rhodesVersion : rhodesVersion},
		  dataType: 'json',
		  success: function(response){
			success_request("create-build-submit", "create-build-status");
			$('#build-create-result').text("Response=> " + response.resp);
		  },
		  error: function(resp){
			error_request("create-build-submit", "create-build-status");
			r = JSON.parse(resp.responseText);
			$('#build-create-result').text("Response=> " + r.text);
		  }
		});
}

function deletebuild(){
	var app_id = $('#delete-app-id').val();
	var id = $('#delete-build-id').val();
	
	start_request("delete-build-submit", "delete-build-status");
	$.ajax({
		  type: 'DELETE',
		  url: '/delete_build',
		  data: {id : id, app_id: app_id},
		  dataType: 'json',
		  success: function(response){
			success_request("delete-build-submit", "delete-build-status");
			$('#build-delete-result').text("Response=> " + response.resp);
		  },
		  error: function(resp){
			error_request("delete-build-submit", "delete-build-status");
			r = JSON.parse(resp.responseText);
			$('#build-delete-result').text("Response=> " + r.text);
		  }
		});
}

function showbuild(){
	var app_id = $('#show-app-id').val();
	var id = $('#show-build-id').val();
	
	start_request("show-build-submit", "show-build-status");
	$.ajax({
		  type: 'GET',
		  url: '/show_build',
		  data: {id : id, app_id: app_id},
		  dataType: 'json',
		  success: function(response){
			success_request("show-build-submit", "show-build-status");
			$('#build-show-result').text("Response=> " + response.resp);
		  },
		  error: function(resp){
			error_request("show-build-submit", "show-build-status");
			r = JSON.parse(resp.responseText);
			$('#build-show-result').text("Response=> " + r.text);
		  }
		});
}

function listbuild(){
	var id = $('#list-build-id').val();
	start_request("list-build-submit", "list-build-status");
	$.ajax({
		  type: 'GET',
		  url: '/list_build',
		  data: {id : id},
		  dataType: 'json',
		  success: function(response){
			success_request("list-build-submit", "list-build-status");
			$('#build-list-result').text("Response=> " + response.resp);
		  },
		  error: function(resp){
			error_request("list-build-submit", "list-build-status");
			r = JSON.parse(resp.responseText);
			$('#build-list-result').text("Response=> " + r.text);
		  }
		});
}
// private functions
function start_request(submit_name, status_name){
	$("#"+ submit_name).attr("disabled","disabled");
	$("."+ status_name)[0].firstChild.className = "label label-warning";
	$("."+ status_name).css("visibility","visible");
	$("."+ status_name)[0].firstChild.innerHTML = "loading...";
}

function error_request(submit_name, status_name){
	$("#"+ submit_name).removeAttr("disabled");
	$("."+ status_name)[0].firstChild.className = "label label-important";
	$("."+ status_name)[0].firstChild.innerHTML = "error";
}

function success_request(submit_name, status_name){
	$("#"+ submit_name).removeAttr("disabled");
	$("."+ status_name)[0].firstChild.className = "label label-success";
	$("."+ status_name)[0].firstChild.innerHTML = "success";
}