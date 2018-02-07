import {BASE_URL} from './config';

export const Token = {
  create (params) {
    return fetch(
      `${BASE_URL}/api/v1/tokens`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(params)
      }
    )
    .then(res => {
      if (res.status === 401) {
        return {error: 'Unauthorized'};
      } else {
        return res.json();
      }
    });
  }
};
