; ModuleID = 'svp_simple_018_001.bc'
source_filename = "./svp_simple_018_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_018_001_para1 = common global float 0.000000e+00, align 4
@svp_simple_018_001_para2 = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_main() #0 !dbg !7 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  call void (...) @init(), !dbg !10
  %3 = bitcast float* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !11
  store float 0.000000e+00, float* %1, align 4, !dbg !12, !tbaa !13
  %4 = bitcast float* %2 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !17
  store float 0.000000e+00, float* %2, align 4, !dbg !18, !tbaa !13
  %5 = call float @svp_simple_018_001_func1(), !dbg !19
  store float %5, float* %1, align 4, !dbg !20, !tbaa !13
  %6 = call float @svp_simple_018_001_func2(), !dbg !21
  store float %6, float* %2, align 4, !dbg !22, !tbaa !13
  %7 = bitcast float* %2 to i8*, !dbg !23
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #3, !dbg !23
  %8 = bitcast float* %1 to i8*, !dbg !23
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #3, !dbg !23
  ret void, !dbg !23
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define float @svp_simple_018_001_func1() #0 !dbg !24 {
  %1 = alloca float, align 4
  %2 = bitcast float* %1 to i8*, !dbg !25
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !25
  store float 0.000000e+00, float* %1, align 4, !dbg !26, !tbaa !13
  %3 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !27, !tbaa !13
  %4 = fmul float 2.000000e+00, %3, !dbg !28
  %5 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !29, !tbaa !13
  %6 = fmul float %4, %5, !dbg !30
  store float %6, float* %1, align 4, !dbg !31, !tbaa !13
  %7 = load float, float* %1, align 4, !dbg !32, !tbaa !13
  %8 = bitcast float* %1 to i8*, !dbg !33
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #3, !dbg !33
  ret float %7, !dbg !34
}

; Function Attrs: nounwind uwtable
define float @svp_simple_018_001_func2() #0 !dbg !35 {
  %1 = alloca float, align 4
  %2 = bitcast float* %1 to i8*, !dbg !36
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !36
  store float 0.000000e+00, float* %1, align 4, !dbg !37, !tbaa !13
  %3 = load volatile float, float* @svp_simple_018_001_para1, align 4, !dbg !38, !tbaa !13
  %4 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !39, !tbaa !13
  %5 = fmul float %3, %4, !dbg !40
  %6 = load volatile float, float* @svp_simple_018_001_para2, align 4, !dbg !41, !tbaa !13
  %7 = fmul float %5, %6, !dbg !42
  store float %7, float* %1, align 4, !dbg !43, !tbaa !13
  %8 = load float, float* %1, align 4, !dbg !44, !tbaa !13
  %9 = bitcast float* %1 to i8*, !dbg !45
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #3, !dbg !45
  ret float %8, !dbg !46
}

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_isr_func1() #0 !dbg !47 {
  store volatile float 1.000000e+00, float* @svp_simple_018_001_para2, align 4, !dbg !48, !tbaa !13
  ret void, !dbg !49
}

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_isr_1() #0 !dbg !50 {
  call void (...) @idlerun(), !dbg !51
  store volatile float 2.000000e+00, float* @svp_simple_018_001_para1, align 4, !dbg !52, !tbaa !13
  ret void, !dbg !53
}

declare void @idlerun(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_018_001_isr_2() #0 !dbg !54 {
  call void (...) @idlerun(), !dbg !55
  call void @svp_simple_018_001_isr_func1(), !dbg !56
  ret void, !dbg !57
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_018_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_018")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_018_001_main", scope: !8, file: !8, line: 30, type: !9, scopeLine: 30, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_018_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_018")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 31, column: 3, scope: !7)
!11 = !DILocation(line: 32, column: 3, scope: !7)
!12 = !DILocation(line: 32, column: 9, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 33, column: 3, scope: !7)
!18 = !DILocation(line: 33, column: 9, scope: !7)
!19 = !DILocation(line: 34, column: 33, scope: !7)
!20 = !DILocation(line: 34, column: 31, scope: !7)
!21 = !DILocation(line: 35, column: 29, scope: !7)
!22 = !DILocation(line: 35, column: 27, scope: !7)
!23 = !DILocation(line: 36, column: 1, scope: !7)
!24 = distinct !DISubprogram(name: "svp_simple_018_001_func1", scope: !8, file: !8, line: 38, type: !9, scopeLine: 38, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 39, column: 3, scope: !24)
!26 = !DILocation(line: 39, column: 9, scope: !24)
!27 = !DILocation(line: 40, column: 18, scope: !24)
!28 = !DILocation(line: 40, column: 16, scope: !24)
!29 = !DILocation(line: 41, column: 14, scope: !24)
!30 = !DILocation(line: 40, column: 43, scope: !24)
!31 = !DILocation(line: 40, column: 12, scope: !24)
!32 = !DILocation(line: 42, column: 10, scope: !24)
!33 = !DILocation(line: 43, column: 1, scope: !24)
!34 = !DILocation(line: 42, column: 3, scope: !24)
!35 = distinct !DISubprogram(name: "svp_simple_018_001_func2", scope: !8, file: !8, line: 45, type: !9, scopeLine: 45, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 46, column: 3, scope: !35)
!37 = !DILocation(line: 46, column: 9, scope: !35)
!38 = !DILocation(line: 47, column: 10, scope: !35)
!39 = !DILocation(line: 48, column: 10, scope: !35)
!40 = !DILocation(line: 47, column: 35, scope: !35)
!41 = !DILocation(line: 49, column: 10, scope: !35)
!42 = !DILocation(line: 48, column: 35, scope: !35)
!43 = !DILocation(line: 47, column: 8, scope: !35)
!44 = !DILocation(line: 50, column: 10, scope: !35)
!45 = !DILocation(line: 51, column: 1, scope: !35)
!46 = !DILocation(line: 50, column: 3, scope: !35)
!47 = distinct !DISubprogram(name: "svp_simple_018_001_isr_func1", scope: !8, file: !8, line: 53, type: !9, scopeLine: 53, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 54, column: 28, scope: !47)
!49 = !DILocation(line: 55, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "svp_simple_018_001_isr_1", scope: !8, file: !8, line: 57, type: !9, scopeLine: 57, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 58, column: 3, scope: !50)
!52 = !DILocation(line: 59, column: 28, scope: !50)
!53 = !DILocation(line: 60, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "svp_simple_018_001_isr_2", scope: !8, file: !8, line: 62, type: !9, scopeLine: 62, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 63, column: 3, scope: !54)
!56 = !DILocation(line: 64, column: 3, scope: !54)
!57 = !DILocation(line: 65, column: 1, scope: !54)
