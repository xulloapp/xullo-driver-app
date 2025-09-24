const Map<String, Map<String, String>> violationTypeMap = {
  'V1': {
    'title': 'Rest Incomplete',
    'description': 'You resumed work before completing a 10-hour rest',
  },
  'V2': {
    'title': 'Insufficient Rest',
    'description': 'You resumed work before completing a 24-hour rest',
  },
  'V3': {
    'title': 'Rest Incomplete',
    'description': 'You resumed work before completing a 30-minute rest',
  },
  'V4': {
    'title': 'Rest Time Alert',
    'description': '⏰ 15 minutes left until 5 hours 30 minutes of rest.',
  },
  'V5': {
    'title': 'Rest Time Alert',
    'description': '⏰ 5 minutes left until 5 hours 30 minutes of rest.',
  },
  'V6': {
    'title': 'Rest Alert',
    'description': 'You will reach 70 hours in 15 minutes',
  },
  'V7': {
    'title': 'Rest Alert',
    'description': 'You will reach 70 hours in 5 minutes',
  },
  'V8': {
    'title': 'Limit reached',
    'description': 'Your 70 hours of work is completed',
  },
  'V9': {
    'title': 'Rest Alert',
    'description': 'You will reach 13 hours in 15 minutes',
  },
  'V10': {
    'title': 'Rest Alert',
    'description': 'You will reach 13 hours in 5 minutes',
  },
  'V11': {
    'title': 'Limit reached',
    'description': 'Your 13 hours of work is completed',
  },
};
