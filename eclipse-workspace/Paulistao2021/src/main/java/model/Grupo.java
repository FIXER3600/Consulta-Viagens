package model;

public class Grupo {
	private String Grupo;
	private int CodigoTime;
	private int Jogos;
	public String getGrupo() {
		return Grupo;
	}
	public void setGrupo(String grupo) {
		Grupo = grupo;
	}
	public int getCodigoTime() {
		return CodigoTime;
	}
	public void setCodigoTime(int codigoTime) {
		CodigoTime = codigoTime;
	}
	public int getJogos() {
		return Jogos;
	}
	public void setJogos(int jogos) {
		Jogos = jogos;
	}
	@Override
	public String toString() {
		return "Grupo [Grupo=" + Grupo + ", CodigoTime=" + CodigoTime + ", Jogos=" + Jogos + "]";
	}
	
	
}
