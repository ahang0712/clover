; ModuleID = 'svp_simple_505_001.bc'
source_filename = "./svp_simple_505_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@myglobal = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @isr_fun() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = bitcast i32* %1 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !10
  %4 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !11
  store i32 %4, i32* %1, align 4, !dbg !12, !tbaa !13
  %5 = bitcast i32* %2 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !17
  %6 = load i32, i32* @myglobal, align 4, !dbg !18, !tbaa !13
  %7 = add nsw i32 %6, 1, !dbg !19
  store i32 %7, i32* %2, align 4, !dbg !20, !tbaa !13
  %8 = load i32, i32* %2, align 4, !dbg !21, !tbaa !13
  store i32 %8, i32* @myglobal, align 4, !dbg !22, !tbaa !13
  %9 = bitcast i32* %2 to i8*, !dbg !23
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #3, !dbg !23
  %10 = bitcast i32* %1 to i8*, !dbg !23
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #3, !dbg !23
  ret void, !dbg !23
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @__VERIFIER_nondet_int(...) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_505_001_isr_1(i8* %0) #0 !dbg !24 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !25
  %4 = bitcast i32* %3 to i8*, !dbg !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !27
  %5 = load i32, i32* @myglobal, align 4, !dbg !28, !tbaa !13
  %6 = add nsw i32 %5, 1, !dbg !29
  store i32 %6, i32* %3, align 4, !dbg !30, !tbaa !13
  %7 = load i32, i32* %3, align 4, !dbg !31, !tbaa !13
  store i32 %7, i32* @myglobal, align 4, !dbg !32, !tbaa !13
  call void @isr_fun(), !dbg !33
  %8 = bitcast i32* %3 to i8*, !dbg !34
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #3, !dbg !34
  ret void, !dbg !34
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_505_001_main() #0 !dbg !35 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !36
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !36
  %3 = load i32, i32* @myglobal, align 4, !dbg !37, !tbaa !13
  %4 = add nsw i32 %3, 1, !dbg !38
  store i32 %4, i32* %1, align 4, !dbg !39, !tbaa !13
  %5 = load i32, i32* %1, align 4, !dbg !40, !tbaa !13
  store i32 %5, i32* @myglobal, align 4, !dbg !41, !tbaa !13
  %6 = bitcast i32* %1 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #3, !dbg !42
  ret i32 0, !dbg !43
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_505_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "isr_fun", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_505_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 8, column: 3, scope: !7)
!11 = !DILocation(line: 8, column: 11, scope: !7)
!12 = !DILocation(line: 8, column: 7, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 9, column: 3, scope: !7)
!18 = !DILocation(line: 9, column: 13, scope: !7)
!19 = !DILocation(line: 9, column: 21, scope: !7)
!20 = !DILocation(line: 9, column: 7, scope: !7)
!21 = !DILocation(line: 10, column: 12, scope: !7)
!22 = !DILocation(line: 10, column: 11, scope: !7)
!23 = !DILocation(line: 12, column: 1, scope: !7)
!24 = distinct !DISubprogram(name: "svp_simple_505_001_isr_1", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !{!26, !26, i64 0}
!26 = !{!"any pointer", !15, i64 0}
!27 = !DILocation(line: 17, column: 3, scope: !24)
!28 = !DILocation(line: 17, column: 13, scope: !24)
!29 = !DILocation(line: 17, column: 21, scope: !24)
!30 = !DILocation(line: 17, column: 7, scope: !24)
!31 = !DILocation(line: 18, column: 12, scope: !24)
!32 = !DILocation(line: 18, column: 11, scope: !24)
!33 = !DILocation(line: 20, column: 3, scope: !24)
!34 = !DILocation(line: 22, column: 1, scope: !24)
!35 = distinct !DISubprogram(name: "svp_simple_505_001_main", scope: !8, file: !8, line: 24, type: !9, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 27, column: 3, scope: !35)
!37 = !DILocation(line: 27, column: 13, scope: !35)
!38 = !DILocation(line: 27, column: 21, scope: !35)
!39 = !DILocation(line: 27, column: 7, scope: !35)
!40 = !DILocation(line: 28, column: 12, scope: !35)
!41 = !DILocation(line: 28, column: 11, scope: !35)
!42 = !DILocation(line: 32, column: 1, scope: !35)
!43 = !DILocation(line: 31, column: 3, scope: !35)
