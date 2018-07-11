public class PostmanTester {
    
    public static String callPostmanDummyClass(){
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        req.setMethod('GET');
        HttpResponse response = new HttpResponse();
        String responseBody = '';
        try{
            response = http.send(req);
            responseBody = response.getBody();
            System.debug(responseBody); 
        }catch(CalloutException ce){
            System.debug('Exception occured while making callout : '+ce.getMessage());
        }
        return responseBody; 
    }
    
}