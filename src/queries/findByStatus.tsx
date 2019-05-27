import gql from "graphql-tag";

export default gql`
  query findByStatus {
    findByStatus(status: $status)
      @rest(type: "Pet", path: "pet/findByStatus?{args}") {
      id
      photoUrls
      tags
      status
    }
  }
`;
