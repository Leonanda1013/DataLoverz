'use client';

import { useState } from 'react';

export default function Home() {
  const [form, setForm] = useState({
    Pregnancies: '',
    Glucose: '',
    BloodPressure: '',
    SkinThickness: '',
    Insulin: '',
    BMI: '',
    DiabetesPedigreeFunction: '',
    Age: '',
  });

  const [result, setResult] = useState('');
  const [loading, setLoading] = useState(false);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async () => {
    setLoading(true);
    setResult('');
    try {
      const response = await fetch('http://127.0.0.1:8000/diabetes_prediction', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          Pregnancies: parseInt(form.Pregnancies),
          Glucose: parseInt(form.Glucose),
          BloodPressure: parseInt(form.BloodPressure),
          SkinThickness: parseInt(form.SkinThickness),
          Insulin: parseInt(form.Insulin),
          BMI: parseFloat(form.BMI),
          DiabetesPedigreeFunction: parseFloat(form.DiabetesPedigreeFunction),
          Age: parseInt(form.Age),
        }),
      });
      const data = await response.json();
      setResult(data.result);
    } catch (error) {
      setResult('Terjadi kesalahan, pastikan backend berjalan.');
    }
    setLoading(false);
  };

  const fields = [
    { name: 'Pregnancies', label: 'Kehamilan (Pregnancies)', type: 'int' },
    { name: 'Glucose', label: 'Glukosa (Glucose)', type: 'int' },
    { name: 'BloodPressure', label: 'Tekanan Darah (Blood Pressure)', type: 'int' },
    { name: 'SkinThickness', label: 'Ketebalan Kulit (Skin Thickness)', type: 'int' },
    { name: 'Insulin', label: 'Insulin', type: 'int' },
    { name: 'BMI', label: 'BMI', type: 'float' },
    { name: 'DiabetesPedigreeFunction', label: 'Diabetes Pedigree Function', type: 'float' },
    { name: 'Age', label: 'Usia (Age)', type: 'int' },
  ];

  return (
    <main className="min-h-screen bg-gradient-to-br from-blue-50 to-blue-100 flex items-center justify-center p-6">
      <div className="bg-white rounded-2xl shadow-lg p-8 w-full max-w-xl">
        <h1 className="text-2xl font-bold text-blue-700 mb-2 text-center">
          🩺 Prediksi Diabetes
        </h1>
        <p className="text-center text-gray-500 text-sm mb-6">
          Masukkan data pasien untuk memprediksi risiko diabetes
        </p>

        <div className="grid grid-cols-2 gap-4">
          {fields.map((field) => (
            <div key={field.name}>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                {field.label}
              </label>
              <input
                type="number"
                name={field.name}
                value={form[field.name as keyof typeof form]}
                onChange={handleChange}
                step={field.type === 'float' ? '0.001' : '1'}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-400"
                placeholder="0"
              />
            </div>
          ))}
        </div>

        <button
          onClick={handleSubmit}
          disabled={loading}
          className="mt-6 w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-xl transition disabled:opacity-50"
        >
          {loading ? 'Memproses...' : 'Prediksi Sekarang'}
        </button>

        {result && (
          <div
            className={`mt-5 p-4 rounded-xl text-center font-semibold text-lg ${
              result.includes('tidak')
                ? 'bg-green-100 text-green-700'
                : 'bg-red-100 text-red-700'
            }`}
          >
            {result.includes('tidak') ? '✅ ' : '⚠️ '}
            {result}
          </div>
        )}
      </div>
    </main>
  );
}