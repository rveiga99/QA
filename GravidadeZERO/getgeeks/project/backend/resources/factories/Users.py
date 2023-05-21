


def   factory_new_user():

    return{
        'name': 'Clint teste',
        'email': 'testeclint@hotmail.com',
        'password':'teste001'
    }

def   factory_get_user():

    return{
        'name': 'Clint teste 001 Get',
        'email': 'testeclintget@hotmail.com',
        'password':'teste001'
    }


def   factory_remove_user():

    return{
        'name': 'Ronaldo Fenomeno',
        'email': 'ronaldo@hotmail.com',
        'password':'teste001'
    }

def factory_update_user():

    email = 'ronaldo@hotmail.com'

    return {
        'before': {
            'name': 'Teste Ronaldo',
            'email': email,
            'password': 'teste001'

        },
        'after': {
            'name': 'Ronaldo Teste',
            'email': email,
            'whatsapp': '19999999999',
            'avatar': ''
        }
    }


def factory_user_session(target):

    name = 'Teste'
    email = 'teste@hotmail.com'
    password = 'teste001'

    data = {
        'signup':{
            'name': name,
            'email': email,
            'password': password

        },
        'login': {
            'email': email,
            'password': password

        }
    }

    return data[target]

def factory_be_geek():

    return {
        'name': 'José Raimundo',
        'email': 'raimundo@teste.com.br',
        'password': 'teste002',
        'geek_profile': {
            'whatsapp': '11999999999',
            'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
            'printer_repair': 'Sim',
            'work': 'Presencial',
            'cost': '150.99'
        }
    }

def factory_search_for_geeks():

    return {
        'name': 'Romário Raimundo',
        'email': 'romario@teste.com.br',
        'password': 'teste002',
        'geek_profile': {
            'whatsapp': '11999999999',
            'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
            'printer_repair': 'Sim',
            'work': 'Presencial',
            'cost': '150.99'
        }
    }