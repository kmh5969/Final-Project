<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="resources/js/calendar.js"></script>
<script type="text/javascript">

//selectbox 값 넣기
$("#edit-category").change(function(){
	var categoryVal = $(this).val();
});

$("#edit-color").change(function(){
	var colorVal = $(this).val();
});


//추월 막기
var editTitle = event.title.val();
var editStart = event.start.format();
var editEnd = event.start.format();

$('#updateEvent').unbind();
$('#updateEvent').on('click', function () {

    if (editStart.val() > editEnd.val()) {
        alert('끝나는 날짜가 앞설 수 없습니다.');
        return false;
    }

    if (editTitle.val() === '') {
        alert('일정명은 필수입니다.')
        return false;
    }
}
// 리사이즈 하루 빼기
function calDateWhenResize(event) {

	  var newDates = {
	    startDate: '',
	    endDate: ''
	  };

	  if (event.allDay) {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
	    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	  } else {
	    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
	    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
	  }

	  return newDates;
	}
</script>


</head>
<body>
	
		<form action="calendarUpdateRes.do" method="post">
		<input type="hidden" name="calendar_seq" value="${calendarDto.calendar_seq }">
		<input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="calendar_title" value="${calendarDto.calendar_title }"></td>
			</tr>
			<tr>
				<tr>
				<th>카테고리</th>
				<td id="category">
					<div class="form-check">
						<label class="form-check-label">
							<select name="calendar_category" id="edit-category">
		                     	<option value="디자인">디자인</option>
		                      	<option value="실무역량">실무역량</option>
		                       	<option value="뷰티">뷰티</option>
		                       	<option value="영상">영상</option>
		                       	<option value="음악">음악</option>
		                       	<option value="기타">기타</option>
		                  	 </select>
		               	</label>
		          	</div>
				</td>
			</tr>
			<tr>
				<th>색상</th>
				<td id="color">
					<div class="form-check">
						<label class="form-check-label">
							<select name="calendar_color" id="edit-color">
								<option value="#D25565" style="color:#D25565;">빨간색</option>
		                    	<option value="#9775fa" style="color:#9775fa;">보라색</option>
		                      	<option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                       	<option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                       	<option value="#f06595" style="color:#f06595;">핑크색</option>
		                       	<option value="#63e6be" style="color:#63e6be;">연두색</option>
		                       	<option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                       	<option value="#4d638c" style="color:#4d638c;">남색</option>
		                       	<option value="#495057" style="color:#495057;">검정색</option>
		                  	</select>
		              	</label>
		          	</div>
				</td>
			</tr>
			<tr>
				<th>시작</th>
				<td><input type="date" name="calendar_start" value="${calendarDto.calendar_start }"></td>
			</tr>
			<tr>
				<th>끝</th>
				<td><input type="date" name="calendar_end" value="${calendarDto.calendar_end }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="calendar_description">${calendarDto.calendar_description }</textarea></td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="viewClose();">
				</td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>