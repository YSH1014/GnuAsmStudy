class C{
	public :
	int a;
	int b;

	void setA(int a){
		this->a = a;
	}
};
int main(){
	C c;
	c.a = 1;
	c.b = 2;

	c.setA(1);
	return 0;
}
