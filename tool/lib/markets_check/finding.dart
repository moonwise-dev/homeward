enum FindingSeverity { error, warning }

typedef Finding = ({FindingSeverity severity, String subject, String message});

Finding findingError(String subject, String message) =>
    (severity: FindingSeverity.error, subject: subject, message: message);

Finding findingWarning(String subject, String message) =>
    (severity: FindingSeverity.warning, subject: subject, message: message);
