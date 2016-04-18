<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Set Feed</title>

    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
		.streams {
             padding: 5px;
             width: 280px;
        }
	</style>
  </head>
  <body>
     <div class="container">
		<div class="row">
		  <div class="col-md-12"><h1>payload feed</h1></div>
		</div>
		<div class="row">
		  <div class="col-md-12">
			  	<table id="eventTable" class="table table-striped">
			  		<thead>
			  			<tr>
			  				<th>Dendency Issue - Status - Type</th>
							<th>Associated Pull Requests - Branch</th>
							<th>Blocks (status) (Type)</th>
							<th>Depends On (status) (Type)</th>
			  			</tr>
			  		</thead>
			  		<tbody id="eventTableBody">
						<#list rows as row>
							<#assign data = row.data>
							<tr>
								<td><a href="${data.payloadDependency.link}">#${data.payloadDependency.label}</a> - ${data.payloadDependency.status} - ${data.payloadDependency.type}</td>
								 <td>
								 	<#if data.associatedPullRequest?has_content>
								    	<#list data.associatedPullRequest>
								    		<ul>
								    		<#items as patch>
				  								<li>
				  									<a href="${patch.link}">#${patch.label}</a> - ${patch.codebase} 
													<#switch patch.commitStatus>
														<#case "success"> <span class="label label-success">success</span><#break>
													  	<#case "failure"> <span class="label label-warning">failure</span><#break>
													  	<#case "error"> <span class="label label-danger">error</span><#break>
													  	<#case "pending"> <span class="label label-default">pending</span><#break>
													</#switch>
				  								</li>
				  							</#items>
				  							</ul>
										</#list>
									</#if>
							    </td>
							</tr>
						</#list>
			  		</tbody>
			  	</table>
		    </div>
		</div>
	</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

  </body>
</html>