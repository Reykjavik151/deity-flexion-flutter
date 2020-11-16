enum Status {none, completed}

class StatusHelper {
  static Status getStatusByString(String statusString) {
    switch (statusString) {
      case 'none':
        return Status.none;
      case 'completed':
        return Status.completed;
    }

    return null;
  }

  static String getStringByStatus(Status status) {
    switch (status) {
      case Status.none:
        return 'none';
      case Status.completed:
        return 'completed';
    }

    return null;
  }
}

