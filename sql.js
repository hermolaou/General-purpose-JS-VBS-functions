/*
Doxa soi, Kyrie, doxa soi.
*/

var queries = [];	//queries queue, очередь запросов

/*
Асинхронный sql-запрос.
	conn - подключение, при готовности вызывает OnCompletion с параметрами: RecordSet с результатами и запрос.
Asynchronous Sql query.
	conn-connection, on completion calls OnCompletion with resulting recordset and the original query. */

function SqlAsync(q, OnCompletion)
{
	//add to queue
	if (typeof conn=="undefined")
		SqlConnect (dbFile)
	
	if (typeof q == "string")
		queries.push({q:ReplaceExtChars(q), callback:OnCompletion});
	else if (typeof q=="object")
		q.forEach(function(query) {
			queries.push({q:ReplaceExtChars(query), callback:OnCompletion});
		});
	
	if (conn.State==(adStateOpen | adStateExecuting))
		return; //Query in progress.
		
	//if queue not empty then run the next query
	if (queries.length==0) return;

	//get from queue
	q=queries.shift();
	
	var rs=conn.Execute (q.q, null, adAsyncExecute);
		
	var sqlInterval=self.setInterval (function () {
		if (rs.state==adStateExecuting) return;
		
		self.clearInterval (sqlInterval);
		
		if (conn.Errors.Count) {
			echo ("adodb errors count:", conn.Errors.Count);
			
			alert (format("ADODB error:", conn.Errors(0).Description, "\n", "Query: ", q.q));					
		
		} else {
						
			//may the recordset be closed at this point?
			if (rs.State==adStateClosed)
				alert ("Recordset arrived closed. This is strange.\n" + q.q);
			else
				q.callback(rs, q.q);
			
			rs.Close();
			
		}	
		
		SqlAsync();
	
	}, 50);

}

/*
queue.push(2);         // queue is now [2]
queue.push(5);         // queue is now [2, 5]
var i = queue.shift(); // queue is now [5]
alert(i);              // displays 2
*/
