public class SlackIntegration {
  @InvocableMethod(label='Send Slack Message123')
  public static void sendMessageFromFlow(List<String> messages) {
    for (String message : messages) {
      sendMessage(message);
    }
  }

  private static void sendMessage(String message) {
    HttpRequest request = new HttpRequest();
    request.setEndpoint(
      'https://hooks.slack.com/services/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'
    );
    request.setMethod('POST');
    request.setHeader('Content-Type', 'application/json;charset=UTF-8');

    Map<String, Object> payload = new Map<String, Object>();
    payload.put('text', message);

    String jsonPayload = JSON.serialize(payload);
    request.setBody(jsonPayload);

    Http http = new Http();
    HttpResponse response = http.send(request);

    if (response.getStatusCode() != 200) {
      System.debug('Error sending message to Slack: ' + response.getBody());
    } else {
      System.debug('✅ Slack message sent: ' + message);
    }
  }
}
