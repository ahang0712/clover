; ModuleID = 'svp_simple_324_001.bc'
source_filename = "./svp_simple_324_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data1 = common global i32 0, align 4
@data2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_324_001_isr_1(i8* %0) #0 !dbg !12 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !13
  %5 = bitcast i32* %3 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4, !dbg !17
  %6 = load i32, i32* @data1, align 4, !dbg !18, !tbaa !19
  %7 = add nsw i32 %6, 1, !dbg !21
  store i32 %7, i32* %3, align 4, !dbg !22, !tbaa !19
  %8 = load i32, i32* %3, align 4, !dbg !23, !tbaa !19
  store i32 %8, i32* @data1, align 4, !dbg !24, !tbaa !19
  %9 = bitcast i32* %4 to i8*, !dbg !25
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #4, !dbg !25
  %10 = load i32, i32* @data2, align 4, !dbg !26, !tbaa !19
  %11 = add nsw i32 %10, 1, !dbg !27
  store i32 %11, i32* %4, align 4, !dbg !28, !tbaa !19
  %12 = load i32, i32* %4, align 4, !dbg !29, !tbaa !19
  store i32 %12, i32* @data2, align 4, !dbg !30, !tbaa !19
  %13 = bitcast i32* %4 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #4, !dbg !31
  %14 = bitcast i32* %3 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #4, !dbg !31
  ret void, !dbg !31
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_324_001_isr_2(i8* %0) #0 !dbg !32 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !13
  %5 = bitcast i32* %3 to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4, !dbg !33
  %6 = load i32, i32* @data1, align 4, !dbg !34, !tbaa !19
  %7 = add nsw i32 %6, 5, !dbg !35
  store i32 %7, i32* %3, align 4, !dbg !36, !tbaa !19
  %8 = load i32, i32* %3, align 4, !dbg !37, !tbaa !19
  store i32 %8, i32* @data1, align 4, !dbg !38, !tbaa !19
  %9 = bitcast i32* %4 to i8*, !dbg !39
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #4, !dbg !39
  %10 = load i32, i32* @data2, align 4, !dbg !40, !tbaa !19
  %11 = add nsw i32 %10, 5, !dbg !41
  store i32 %11, i32* %4, align 4, !dbg !42, !tbaa !19
  %12 = load i32, i32* %4, align 4, !dbg !43, !tbaa !19
  store i32 %12, i32* @data2, align 4, !dbg !44, !tbaa !19
  %13 = bitcast i32* %4 to i8*, !dbg !45
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #4, !dbg !45
  %14 = bitcast i32* %3 to i8*, !dbg !45
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #4, !dbg !45
  ret void, !dbg !45
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_324_001_main() #0 !dbg !46 {
  store i32 10, i32* @data1, align 4, !dbg !47, !tbaa !19
  store i32 10, i32* @data2, align 4, !dbg !48, !tbaa !19
  %1 = load i32, i32* @data1, align 4, !dbg !49, !tbaa !19
  %2 = icmp eq i32 %1, 16, !dbg !50
  br i1 %2, label %3, label %8, !dbg !51

3:                                                ; preds = %0
  %4 = load i32, i32* @data2, align 4, !dbg !52, !tbaa !19
  %5 = icmp eq i32 %4, 5, !dbg !53
  br i1 %5, label %6, label %8, !dbg !49

6:                                                ; preds = %3
  br label %7, !dbg !54

7:                                                ; preds = %6
  call void @reach_error(), !dbg !55
  call void @abort() #5, !dbg !56
  unreachable, !dbg !56

8:                                                ; preds = %3, %0
  ret i32 0, !dbg !57
}

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_324_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_324_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_324_001_isr_1", scope: !8, file: !8, line: 6, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 8, column: 3, scope: !12)
!18 = !DILocation(line: 8, column: 13, scope: !12)
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !15, i64 0}
!21 = !DILocation(line: 8, column: 19, scope: !12)
!22 = !DILocation(line: 8, column: 7, scope: !12)
!23 = !DILocation(line: 9, column: 11, scope: !12)
!24 = !DILocation(line: 9, column: 9, scope: !12)
!25 = !DILocation(line: 10, column: 3, scope: !12)
!26 = !DILocation(line: 10, column: 14, scope: !12)
!27 = !DILocation(line: 10, column: 20, scope: !12)
!28 = !DILocation(line: 10, column: 7, scope: !12)
!29 = !DILocation(line: 11, column: 11, scope: !12)
!30 = !DILocation(line: 11, column: 9, scope: !12)
!31 = !DILocation(line: 12, column: 1, scope: !12)
!32 = distinct !DISubprogram(name: "svp_simple_324_001_isr_2", scope: !8, file: !8, line: 15, type: !9, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 17, column: 3, scope: !32)
!34 = !DILocation(line: 17, column: 13, scope: !32)
!35 = !DILocation(line: 17, column: 19, scope: !32)
!36 = !DILocation(line: 17, column: 7, scope: !32)
!37 = !DILocation(line: 18, column: 11, scope: !32)
!38 = !DILocation(line: 18, column: 9, scope: !32)
!39 = !DILocation(line: 19, column: 3, scope: !32)
!40 = !DILocation(line: 19, column: 14, scope: !32)
!41 = !DILocation(line: 19, column: 20, scope: !32)
!42 = !DILocation(line: 19, column: 7, scope: !32)
!43 = !DILocation(line: 20, column: 11, scope: !32)
!44 = !DILocation(line: 20, column: 9, scope: !32)
!45 = !DILocation(line: 21, column: 1, scope: !32)
!46 = distinct !DISubprogram(name: "svp_simple_324_001_main", scope: !8, file: !8, line: 24, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 27, column: 9, scope: !46)
!48 = !DILocation(line: 28, column: 9, scope: !46)
!49 = !DILocation(line: 30, column: 7, scope: !46)
!50 = !DILocation(line: 30, column: 12, scope: !46)
!51 = !DILocation(line: 30, column: 17, scope: !46)
!52 = !DILocation(line: 30, column: 20, scope: !46)
!53 = !DILocation(line: 30, column: 25, scope: !46)
!54 = !DILocation(line: 31, column: 3, scope: !46)
!55 = !DILocation(line: 32, column: 13, scope: !46)
!56 = !DILocation(line: 32, column: 27, scope: !46)
!57 = !DILocation(line: 35, column: 3, scope: !46)
