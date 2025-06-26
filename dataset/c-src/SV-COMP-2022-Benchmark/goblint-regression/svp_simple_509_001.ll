; ModuleID = 'svp_simple_509_001.bc'
source_filename = "./svp_simple_509_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@myglobal = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @munge() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #2, !dbg !10
  %3 = load i32, i32* @myglobal, align 4, !dbg !11, !tbaa !12
  %4 = add nsw i32 %3, 1, !dbg !16
  store i32 %4, i32* %1, align 4, !dbg !17, !tbaa !12
  %5 = load i32, i32* %1, align 4, !dbg !18, !tbaa !12
  store i32 %5, i32* @myglobal, align 4, !dbg !19, !tbaa !12
  %6 = bitcast i32* %1 to i8*, !dbg !20
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #2, !dbg !20
  ret void, !dbg !20
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @isr_munge() #0 !dbg !21 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !22
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #2, !dbg !22
  %3 = load i32, i32* @myglobal, align 4, !dbg !23, !tbaa !12
  %4 = add nsw i32 %3, 1, !dbg !24
  store i32 %4, i32* %1, align 4, !dbg !25, !tbaa !12
  %5 = load i32, i32* %1, align 4, !dbg !26, !tbaa !12
  store i32 %5, i32* @myglobal, align 4, !dbg !27, !tbaa !12
  %6 = bitcast i32* %1 to i8*, !dbg !28
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #2, !dbg !28
  ret void, !dbg !28
}

; Function Attrs: nounwind uwtable
define void @svp_simple_509_001_isr_1(i8* %0) #0 !dbg !29 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !30
  call void @isr_munge(), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_509_001_main() #0 !dbg !34 {
  call void @munge(), !dbg !35
  ret i32 0, !dbg !36
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_509_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "munge", scope: !8, file: !8, line: 6, type: !9, scopeLine: 6, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_509_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 7, column: 3, scope: !7)
!11 = !DILocation(line: 7, column: 13, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 7, column: 21, scope: !7)
!17 = !DILocation(line: 7, column: 7, scope: !7)
!18 = !DILocation(line: 8, column: 12, scope: !7)
!19 = !DILocation(line: 8, column: 11, scope: !7)
!20 = !DILocation(line: 11, column: 1, scope: !7)
!21 = distinct !DISubprogram(name: "isr_munge", scope: !8, file: !8, line: 12, type: !9, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = !DILocation(line: 13, column: 3, scope: !21)
!23 = !DILocation(line: 13, column: 13, scope: !21)
!24 = !DILocation(line: 13, column: 21, scope: !21)
!25 = !DILocation(line: 13, column: 7, scope: !21)
!26 = !DILocation(line: 14, column: 12, scope: !21)
!27 = !DILocation(line: 14, column: 11, scope: !21)
!28 = !DILocation(line: 17, column: 1, scope: !21)
!29 = distinct !DISubprogram(name: "svp_simple_509_001_isr_1", scope: !8, file: !8, line: 19, type: !9, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!30 = !{!31, !31, i64 0}
!31 = !{!"any pointer", !14, i64 0}
!32 = !DILocation(line: 20, column: 3, scope: !29)
!33 = !DILocation(line: 22, column: 1, scope: !29)
!34 = distinct !DISubprogram(name: "svp_simple_509_001_main", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 27, column: 3, scope: !34)
!36 = !DILocation(line: 28, column: 3, scope: !34)
