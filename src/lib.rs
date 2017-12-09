extern crate diesel;
extern crate iron;
#[macro_use] extern crate juniper;
#[macro_use] extern crate juniper_codegen;
extern crate juniper_iron;
extern crate mount;

use mount::Mount;
use iron::headers::ContentType;
use iron::prelude::*;
use juniper::EmptyMutation;
use juniper_iron::GraphQLHandler;
use juniper::graphiql::graphiql_source;

struct Root;

graphql_object!(Root : () |&self| {
    field foo() -> String {
        "Bar".to_owned()
    }
});

fn graphiql_endpoint(_: &mut Request) -> IronResult<Response> {
    let graphql_endpoint_url = "0.0.0.0:8080/graphql";
    let mut res = Response::with((iron::status::Ok, graphiql_source(graphql_endpoint_url)));
    res.headers.set(ContentType::html());
    Ok(res)
}

fn context_factory(_: &mut Request) -> () {
    ()
}

pub fn run() {
    let mut mount = Mount::new();
    let graphql_endpoint = GraphQLHandler::new(
        context_factory,
        Root,
        EmptyMutation::<()>::new()
    );

    mount.mount("/graphql", graphql_endpoint);
    mount.mount("/graphiql", graphiql_endpoint);
    let chain = Chain::new(mount);
    Iron::new(chain).http("0.0.0.0:8080").unwrap();
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
