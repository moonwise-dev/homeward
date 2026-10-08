enum FindingSeverity { error, warning }

typedef Finding = ({FindingSeverity severity, String subject, String message});

Finding findingError(String subject, String message) =>
    (severity: FindingSeverity.error, subject: subject, message: message);
