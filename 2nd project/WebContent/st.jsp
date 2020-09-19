<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="jquery-3.5.1.min.js"></script>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="star.js"></script>
<style>

		/* 1�� ���� ��Ÿ�� */
	.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
	


	/* 2�� ���� ��Ÿ�� */
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
    
    /* 3�� ���� ��Ÿ�� */
    span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
 
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}
</style>
</head>
<body>
<div class="form-group">

<!-- 1�� ���� -->
<label for="reply_star">����</label>
	<span class="star-input">
		<span class="input">
    			<input type="radio" name="reply_star" id="p1" value="1">
    						<label for="p1">1</label>
    			<input type="radio" name="reply_star" id="p2" value="2">
    						<label for="p2">2</label>
   			<input type="radio" name="reply_star" id="p3" value="3">
   					 		<label for="p3">3</label>
  			<input type="radio" name="reply_star" id="p4" value="4">
  							<label for="p4">4</label>
    			<input type="radio" name="reply_star" id="p5" value="5">
    						<label for="p5">5</label>
  		</span>
  				<output for="star-input"><b>0</b>��</output>						
	</span>
</div>

<!-- 2�� ����  -->

<p id="star_grade">
        <a href="#">��</a>
        <a href="#">��</a>
        <a href="#">��</a>
        <a href="#">��</a>
        <a href="#">��</a>
</p>


<!-- 3�� ����(���ڸ� �����ϰ� �������� �ٲ��ִ°�) -->
<!--���� ����(�����Է��Ѹ�ŭ�� ��ĥ��...)  -->
 <span class="star-prototype">4</span> (4)
 
 
 
 
 

<!-- 1�� ���� ��ũ��Ʈ -->
<script type="text/javascript">
var starRating = function(){
	  var $star = $(".star-input"),
	      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".star-input>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".star-input>.input", function(){
	    
	    	var $this = $(this);
	    
	    	setTimeout(function(){
	      
	    		if($this.find(":focus").length === 0){
	    			$this.removeClass("focus");
	    		}
	    }, 1000);
	  })
	    .on("change", ".star-input :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".star-input label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".star-input>.input", function(){
	    
	    	var $checked = $star.find(":checked");
	    
	    	if($checked.length === 0){
	    		$result.text("0");
	    	} else {
	    		$result.text($checked.next().text());
	    	}
	  });
	};
	starRating();
</script>

<!-- 2�� ���� ��ũ��Ʈ -->
<script>
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* ������ on Ŭ���� ���� ���� */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* Ŭ���� ����, �� �� ���� ������ on Ŭ���� �߰� */
            return false;
        });
</script>

<!-- 3�� ���� ��ũ��Ʈ -->
<script type="text/javascript">
$.fn.generateStars = function() {
    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
};

// ���� ������ ���� ��ȯ�ϵ��� ȣ���ϴ� �Լ�
$('.star-prototype').generateStars();
</script>

<!-- 4�� ���� ��ũ��Ʈ -->

</body>
</html>