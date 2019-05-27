import React from "react";
import "./App.css";
import findByStatus from "./queries/findByStatus";
import { Query } from "react-apollo";

const App: React.FC = () => {
  return (
    <Query query={findByStatus} variables={{ status: "available" }}>
      {({ loading, data }: { loading: boolean; data: {} }) => (
        <div className="App">
          {loading && <header className="App-header">Loading...</header>}
          <pre>
            <code>{JSON.stringify(data, undefined, 2)}</code>
          </pre>
        </div>
      )}
    </Query>
  );
};

export default App;
