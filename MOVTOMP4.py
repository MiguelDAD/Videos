from moviepy.editor import VideoFileClip

def convert_prores_to_mp4(input_file, output_file):
    try:
        # Cargar el archivo de entrada
        clip = VideoFileClip(input_file)
        
        # Guardar el archivo convertido como MP4
        clip.write_videofile(output_file, codec='libx264', audio_codec='aac')
        
        print(f"Conversión completada. El archivo se guardó como: {output_file}")
    except Exception as e:
        print(f"Error durante la conversión: {e}")

# Ejemplo de uso
input_file = r"C:\Users\migue\Desktop\Secuencia01.mov" # Archivo de entrada en formato ProRes 422 HQ
output_file = r"C:\Users\migue\Desktop\video_convertido.mp4"  # Archivo de salida en formato MP4
convert_prores_to_mp4(input_file, output_file)
