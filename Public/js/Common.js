;(function(){
	function Common(){}
	
	Common = {
			ajax:function(url,paraBean,callback,dt){
				var dataType = dt||"json";
				$.ajax({
					url:url,
					type:"post",
					dataType:dataType,
					data:paraBean,
					cache:false,
					error :function(){
						alert("操作失败!");
					},
					success:function(data){
						if(callback != null){
							callback(data);
						}						
					}
				});
			},			
			getDate:function(){
				var d = new Date();
				return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			}
	};
	
	if(!window.Common){
		window["Common"] = Common;
	}
})();