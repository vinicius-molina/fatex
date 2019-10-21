# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Fatex.Repo.insert!(%Fatex.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Fatex.Repo
alias Fatex.LatexConfigs.{Model, Step, Section}
alias Fatex.Accounts.User

Repo.insert!(%User{
  name: "vinicius",
  email: "vinicius_molina@hotmail.com",
  password: "test",
  models: [
    %Model{
      name: "default",
      steps: [
        %Step{
          name: "Informações",
          sections: [
            %Section{
              name: "Explicação inicial",
              content: "",
              type: "text"
            }
          ]
        },

        %Step{
          name: "Introdução",
          sections: [
            %Section{
              name: "Explicação inicial",
              content: "",
              type: "text"
            }
          ]
        },

        %Step{
          name: "Desenvolvimento",
          sections: [
            %Section{
              name: "Explicação inicial",
              content: "",
              type: "text"
            }
          ]
        },

        %Step{
          name: "Testes e Resultados",
          sections: [
            %Section{
              name: "Testes",
              content: "",
              type: "text"
            },
            %Section{
              name: "Resultados",
              content: "",
              type: "text"
            }
          ]
        },

        %Step{
          name: "Discussão e Conclusão",
          sections: [
            %Section{
              name: "Discussão",
              content: "",
              type: "text"
            },
            %Section{
              name: "Conclusão",
              content: "",
              type: "text"
            }
          ]
        },

        %Step{
          name: "Resumo",
          sections: [
            %Section{
              name: "Resumo",
              content: "",
              type: "text"
            },
            %Section{
              name: "Abstract",
              content: "",
              type: "text"
            }
          ]
        }
      ]
    }
  ]
})