typedef Finding = ({String subject, String message});

Finding findingError(String subject, String message) =>
    (subject: subject, message: message);
