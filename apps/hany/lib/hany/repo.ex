defmodule Hany.Repo do
  alias HanyCluster.Rpc

  def config() do
    __MODULE__.__exec__(:config, [])
  end

  def aggregate(queryable, aggregate, opts \\ []) do
    __MODULE__.__exec__(:aggregate, [queryable, aggregate, opts])
  end

  def aggregate(queryable, aggregate, field, opts) do
    __MODULE__.__exec__(:aggregate, [queryable, aggregate, field, opts])
  end

  def all(queryable, opts \\ []) do
    __MODULE__.__exec__(:all, [queryable, opts])
  end

  def delete(struct_or_changeset, opts \\ []) do
    __MODULE__.__exec__(:delete, [struct_or_changeset, opts])
  end

  def delete!(struct_or_changeset, opts \\ []) do
    __MODULE__.__exec__(:delete!, [struct_or_changeset, opts])
  end

  def delete_all(queryable, opts \\ []) do
    __MODULE__.__exec__(:delete_all, [queryable, opts])
  end

  def exists?(queryable, opts \\ []) do
    __MODULE__.__exec__(:exists?, [queryable, opts])
  end

  def get(queryable, id, opts \\ []) do
    __MODULE__.__exec__(:get, [queryable, id, opts])
  end

  def get!(queryable, id, opts \\ []) do
    __MODULE__.__exec__(:get!, [queryable, id, opts])
  end

  def get_by(queryable, clauses, opts \\ []) do
    __MODULE__.__exec__(:get_by, [queryable, clauses, opts])
  end

  def get_by!(queryable, clauses, opts \\ []) do
    __MODULE__.__exec__(:get_by!, [queryable, clauses, opts])
  end

  def get_dynamic_repo() do
    __MODULE__.__exec__(:get_dynamic_repo, [])
  end

  def insert(struct_or_changeset, opts \\ []) do
    __MODULE__.__exec__(:insert, [struct_or_changeset, opts])
  end

  def insert!(struct_or_changeset, opts \\ []) do
    __MODULE__.__exec__(:insert!, [struct_or_changeset, opts])
  end

  def insert_all(schema_or_source, entries_or_query, opts \\ []) do
    __MODULE__.__exec__(:insert_all, [schema_or_source, entries_or_query, opts])
  end

  def insert_or_update(changeset, opts \\ []) do
    __MODULE__.__exec__(:insert_or_update, [changeset, opts])
  end

  def insert_or_update!(changeset, opts \\ []) do
    __MODULE__.__exec__(:insert_or_update!, [changeset, opts])
  end

  def one(queryable, opts \\ []) do
    __MODULE__.__exec__(:one, [queryable, opts])
  end

  def one!(queryable, opts \\ []) do
    __MODULE__.__exec__(:one!, [queryable, opts])
  end

  def preload(structs_or_struct_or_nil, preloads, opts \\ []) do
    __MODULE__.__exec__(:preload, [
      structs_or_struct_or_nil,
      preloads,
      opts
    ])
  end

  def prepare_query(operation, query, opts \\ []) do
    __MODULE__.__exec__(:prepare_query, [operation, query, opts])
  end

  def put_dynamic_repo(name_or_pid) do
    __MODULE__.__exec__(:put_dynamic_repo, [name_or_pid])
  end

  def query(query, params \\ [], opts \\ []) do
    __MODULE__.__exec__(:query, [query, params, opts])
  end

  def query!(query, params \\ [], opts \\ []) do
    __MODULE__.__exec__(:query!, [query, params, opts])
  end

  def reload(struct_or_structs, opts \\ []) do
    __MODULE__.__exec__(:reload, [struct_or_structs, opts])
  end

  def reload!(struct_or_structs, opts \\ []) do
    __MODULE__.__exec__(:reload!, [struct_or_structs, opts])
  end

  def rollback(value) do
    __MODULE__.__exec__(:rollback, [value])
  end

  def stream(queryable, opts \\ []) do
    __MODULE__.__exec__(:stream, [queryable, opts])
  end

  def transaction(fun_or_multi, opts \\ []) do
    __MODULE__.__exec__(:transaction, [fun_or_multi, opts])
  end

  def update(changeset, opts \\ []) do
    __MODULE__.__exec__(:update, [changeset, opts])
  end

  def update!(changeset, opts \\ []) do
    __MODULE__.__exec__(:update!, [changeset, opts])
  end

  def update_all(queryable, updates, opts \\ []) do
    __MODULE__.__exec__(:update_all, [queryable, updates, opts])
  end

  def __exec__(func, args) do
    Rpc.call(__MODULE__.Local, func, args)
  end
end
