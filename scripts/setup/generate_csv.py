import csv
import os
from faker import Faker
import random
from datetime import datetime

fake = Faker('es_MX')
base_dir = 'data/csv'
if not os.path.exists(base_dir):
    os.makedirs(base_dir)


def current_timestamp():
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')


def generate_contactos(total):
    return [{'id_contacto': i + 1, 'email': fake.email(), 'telefono': fake.phone_number(),
             'created_at': current_timestamp(), 'updated_at': current_timestamp()} for i in range(total)]


def generate_especialidades(total):
    especialidades = ['Cardiología', 'Dermatología', 'Endocrinología', 'Gastroenterología', 'Hematología',
                      'Medicina General', 'Neurología', 'Oncología', 'Pediatría', 'Psiquiatría', 'Reumatología',
                      'Urología', 'Ginecología', 'Oftalmología', 'Ortopedia']
    return [{'id_especialidad': i + 1, 'nombre': name, 'descripcion': fake.text(max_nb_chars=200),
             'created_at': current_timestamp(), 'updated_at': current_timestamp()} for i, name in enumerate(especialidades[:total])]


def generate_localidades(total):
    return [{'id_localidad': i + 1, 'codigo_postal': fake.postcode(), 'nombre': fake.city(),
             'created_at': current_timestamp(), 'updated_at': current_timestamp()} for i in range(total)]


def generate_centros_de_salud(total, localidades, contactos):
    return [{'id_centro_de_salud': i + 1, 'id_localidad': random.randint(1, localidades),
             'id_contacto': random.randint(1, contactos), 'direccion': fake.address(),
             'created_at': current_timestamp(), 'updated_at': current_timestamp()} for i in range(total)]


def generate_pacientes(total, contactos):
    return [{'id_paciente': i + 1, 'nombre': fake.first_name(), 'apellido': fake.last_name(),
             'fecha_de_nacimiento': fake.date_of_birth(minimum_age=0, maximum_age=100).isoformat(),
             'direccion': fake.address(), 'id_contacto': random.randint(1, contactos),
             'created_at': current_timestamp(), 'updated_at': current_timestamp()} for i in range(total)]


def generate_profesionales(total, especialidades, contactos):
    disponibilidad_options = ['Disponible', 'No Disponible']
    return [{'id_profesional': i + 1, 'nombre': fake.first_name(), 'apellido': fake.last_name(),
             'disponibilidad': random.choice(disponibilidad_options), 'id_especialidad': random.randint(1, especialidades),
             'id_contacto': random.randint(1, contactos), 'created_at': current_timestamp(), 'updated_at': current_timestamp()} for i in range(total)]


def generate_motivos(total):
    descriptions = ['Consulta general', 'Revisión anual', 'Síntomas de gripe', 'Vacunación',
                    'Control de presión arterial', 'Chequeo cardíaco', 'Consulta pediátrica',
                    'Consulta psicológica', 'Revisión de medicamentos', 'Examen de sangre']
    return [{'id_motivo': i + 1, 'descripcion': desc, 'created_at': current_timestamp(),
             'updated_at': current_timestamp()} for i, desc in enumerate(descriptions[:total])]


def generate_citas(total, centros, profesionales, pacientes, motivos):
    estados = ['Activa', 'Cancelada', 'Completada']
    return [{'id_cita': i + 1, 'id_centro_de_salud': random.randint(1, centros),
             'id_profesional': random.randint(1, profesionales), 'id_paciente': random.randint(1, pacientes),
             'id_motivo': random.randint(1, motivos), 'fecha': fake.date_time_this_year().isoformat(),
             'estado': random.choice(estados), 'created_at': current_timestamp(), 'updated_at': current_timestamp()} for i in range(total)]


def write_to_csv(data, file_path):
    keys = data[0].keys()
    with open(file_path, 'w', newline='', encoding='utf-8') as output_file:
        dict_writer = csv.DictWriter(output_file, keys)
        dict_writer.writeheader()
        dict_writer.writerows(data)


contactos = generate_contactos(200)
especialidades = generate_especialidades(20)
localidades = generate_localidades(15)
centros_de_salud = generate_centros_de_salud(
    50, len(localidades), len(contactos))
pacientes = generate_pacientes(100, len(contactos))
profesionales = generate_profesionales(50, len(especialidades), len(contactos))
motivos = generate_motivos(15)
citas = generate_citas(200, len(centros_de_salud), len(
    profesionales), len(pacientes), len(motivos))

write_to_csv(contactos, os.path.join(base_dir, 'contactos.csv'))
write_to_csv(especialidades, os.path.join(base_dir, 'especialidades.csv'))
write_to_csv(localidades, os.path.join(base_dir, 'localidades.csv'))
write_to_csv(centros_de_salud, os.path.join(base_dir, 'centros_de_salud.csv'))
write_to_csv(pacientes, os.path.join(base_dir, 'pacientes.csv'))
write_to_csv(profesionales, os.path.join(
    base_dir, 'profesionales_de_salud.csv'))
write_to_csv(motivos, os.path.join(base_dir, 'motivos.csv'))
write_to_csv(citas, os.path.join(base_dir, 'citas.csv'))

print('CSV files generated successfully!')
