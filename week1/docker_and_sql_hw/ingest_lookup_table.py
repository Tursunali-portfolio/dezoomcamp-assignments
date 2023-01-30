import pandas as pd
from sqlalchemy import create_engine
import argparse


def main(args):
    file = args.file
    host = args.host
    port = args.port
    user = args.user
    password = args.password
    db = args.db
    table = "zone_lookup"

    engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{db}")

    df = pd.read_csv(file)
    df.head(n=0).to_sql(name=table, con=engine, if_exists="replace")
    df.to_sql(name=table, con=engine, if_exists="append")

def params():
    parser = argparse.ArgumentParser(description="Copy csv to Postgres")

    parser.add_argument("--file", "-f", required=True, help="Path to csv file")
    parser.add_argument(
        "--host", "-H", default="localhost", help="Host of the Postgres db"
    )
    parser.add_argument("--port", "-p", default=5432, help="Port of the Postgres db")
    parser.add_argument(
        "--user", "-u", required=True, help="Username of the Postgres db"
    )
    parser.add_argument(
        "--password", "-P", required=True, help="Password of the Postgres DB"
    )
    parser.add_argument("--db", required=True, help="Name of the database to use")

    return parser.parse_args()


if __name__ == "__main__":
    args = params()
    main(args)
